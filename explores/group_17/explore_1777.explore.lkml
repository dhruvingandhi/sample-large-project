# Explore: explore_1777
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05332.view.lkml"
include: "/views/domain_34/view_05334.view.lkml"
include: "/views/domain_35/view_05335.view.lkml"
include: "/views/domain_36/view_05336.view.lkml"

explore: explore_1777 {
  label: "Explore Explore 1777"
  description: "Comprehensive analytics explore joining base view_05332 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05332
  
  always_filter: {
    filters: [view_05332.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05332.created_at_date: "7 days"]
    unless: [view_05332.id, view_05332.status]
  }

  join: view_05334 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05332.user_id} = ${view_05334.id} ;;
    required_joins: []
  }

  join: view_05335 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05332.account_id} = ${view_05335.account_id} ;;
    required_joins: [view_05334]
  }

  join: view_05336 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05332.category} = ${view_05336.category} ;;
  }

  access_filter: {
    field: view_05332.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05332.is_deleted} = false ;;
}
