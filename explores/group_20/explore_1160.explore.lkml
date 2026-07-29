# Explore: explore_1160
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03481.view.lkml"
include: "/views/domain_33/view_03483.view.lkml"
include: "/views/domain_34/view_03484.view.lkml"
include: "/views/domain_35/view_03485.view.lkml"

explore: explore_1160 {
  label: "Explore Explore 1160"
  description: "Comprehensive analytics explore joining base view_03481 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03481
  
  always_filter: {
    filters: [view_03481.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03481.created_at_date: "7 days"]
    unless: [view_03481.id, view_03481.status]
  }

  join: view_03483 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03481.user_id} = ${view_03483.id} ;;
    required_joins: []
  }

  join: view_03484 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03481.account_id} = ${view_03484.account_id} ;;
    required_joins: [view_03483]
  }

  join: view_03485 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03481.category} = ${view_03485.category} ;;
  }

  access_filter: {
    field: view_03481.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03481.is_deleted} = false ;;
}
