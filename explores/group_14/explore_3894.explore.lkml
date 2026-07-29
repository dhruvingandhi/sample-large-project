# Explore: explore_3894
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11683.view.lkml"
include: "/views/domain_35/view_11685.view.lkml"
include: "/views/domain_36/view_11686.view.lkml"
include: "/views/domain_37/view_11687.view.lkml"

explore: explore_3894 {
  label: "Explore Explore 3894"
  description: "Comprehensive analytics explore joining base view_11683 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11683
  
  always_filter: {
    filters: [view_11683.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11683.created_at_date: "7 days"]
    unless: [view_11683.id, view_11683.status]
  }

  join: view_11685 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11683.user_id} = ${view_11685.id} ;;
    required_joins: []
  }

  join: view_11686 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11683.account_id} = ${view_11686.account_id} ;;
    required_joins: [view_11685]
  }

  join: view_11687 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11683.category} = ${view_11687.category} ;;
  }

  access_filter: {
    field: view_11683.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11683.is_deleted} = false ;;
}
