# Explore: explore_0773
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02320.view.lkml"
include: "/views/domain_22/view_02322.view.lkml"
include: "/views/domain_23/view_02323.view.lkml"
include: "/views/domain_24/view_02324.view.lkml"

explore: explore_0773 {
  label: "Explore Explore 0773"
  description: "Comprehensive analytics explore joining base view_02320 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02320
  
  always_filter: {
    filters: [view_02320.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02320.created_at_date: "7 days"]
    unless: [view_02320.id, view_02320.status]
  }

  join: view_02322 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02320.user_id} = ${view_02322.id} ;;
    required_joins: []
  }

  join: view_02323 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02320.account_id} = ${view_02323.account_id} ;;
    required_joins: [view_02322]
  }

  join: view_02324 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02320.category} = ${view_02324.category} ;;
  }

  access_filter: {
    field: view_02320.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02320.is_deleted} = false ;;
}
