# Update for 2000 file diff target
# Explore: explore_1860
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05581.view.lkml"
include: "/views/domain_33/view_05583.view.lkml"
include: "/views/domain_34/view_05584.view.lkml"
include: "/views/domain_35/view_05585.view.lkml"

explore: explore_1860 {
  label: "Explore Explore 1860"
  description: "Comprehensive analytics explore joining base view_05581 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05581
  
  always_filter: {
    filters: [view_05581.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05581.created_at_date: "7 days"]
    unless: [view_05581.id, view_05581.status]
  }

  join: view_05583 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05581.user_id} = ${view_05583.id} ;;
    required_joins: []
  }

  join: view_05584 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05581.account_id} = ${view_05584.account_id} ;;
    required_joins: [view_05583]
  }

  join: view_05585 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05581.category} = ${view_05585.category} ;;
  }

  access_filter: {
    field: view_05581.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05581.is_deleted} = false ;;
}
