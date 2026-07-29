# Explore: explore_2457
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07372.view.lkml"
include: "/views/domain_24/view_07374.view.lkml"
include: "/views/domain_25/view_07375.view.lkml"
include: "/views/domain_26/view_07376.view.lkml"

explore: explore_2457 {
  label: "Explore Explore 2457"
  description: "Comprehensive analytics explore joining base view_07372 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07372
  
  always_filter: {
    filters: [view_07372.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07372.created_at_date: "7 days"]
    unless: [view_07372.id, view_07372.status]
  }

  join: view_07374 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07372.user_id} = ${view_07374.id} ;;
    required_joins: []
  }

  join: view_07375 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07372.account_id} = ${view_07375.account_id} ;;
    required_joins: [view_07374]
  }

  join: view_07376 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07372.category} = ${view_07376.category} ;;
  }

  access_filter: {
    field: view_07372.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07372.is_deleted} = false ;;
}
