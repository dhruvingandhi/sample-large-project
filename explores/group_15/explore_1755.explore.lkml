# Explore: explore_1755
# Auto-generated LookML Explore File

include: "/views/domain_16/view_05266.view.lkml"
include: "/views/domain_18/view_05268.view.lkml"
include: "/views/domain_19/view_05269.view.lkml"
include: "/views/domain_20/view_05270.view.lkml"

explore: explore_1755 {
  label: "Explore Explore 1755"
  description: "Comprehensive analytics explore joining base view_05266 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05266
  
  always_filter: {
    filters: [view_05266.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05266.created_at_date: "7 days"]
    unless: [view_05266.id, view_05266.status]
  }

  join: view_05268 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05266.user_id} = ${view_05268.id} ;;
    required_joins: []
  }

  join: view_05269 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05266.account_id} = ${view_05269.account_id} ;;
    required_joins: [view_05268]
  }

  join: view_05270 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05266.category} = ${view_05270.category} ;;
  }

  access_filter: {
    field: view_05266.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05266.is_deleted} = false ;;
}
