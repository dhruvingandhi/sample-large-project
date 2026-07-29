# Explore: explore_2755
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08266.view.lkml"
include: "/views/domain_18/view_08268.view.lkml"
include: "/views/domain_19/view_08269.view.lkml"
include: "/views/domain_20/view_08270.view.lkml"

explore: explore_2755 {
  label: "Explore Explore 2755"
  description: "Comprehensive analytics explore joining base view_08266 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08266
  
  always_filter: {
    filters: [view_08266.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08266.created_at_date: "7 days"]
    unless: [view_08266.id, view_08266.status]
  }

  join: view_08268 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08266.user_id} = ${view_08268.id} ;;
    required_joins: []
  }

  join: view_08269 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08266.account_id} = ${view_08269.account_id} ;;
    required_joins: [view_08268]
  }

  join: view_08270 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08266.category} = ${view_08270.category} ;;
  }

  access_filter: {
    field: view_08266.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08266.is_deleted} = false ;;
}
