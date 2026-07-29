# Explore: explore_3822
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11467.view.lkml"
include: "/views/domain_19/view_11469.view.lkml"
include: "/views/domain_20/view_11470.view.lkml"
include: "/views/domain_21/view_11471.view.lkml"

explore: explore_3822 {
  label: "Explore Explore 3822"
  description: "Comprehensive analytics explore joining base view_11467 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11467
  
  always_filter: {
    filters: [view_11467.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11467.created_at_date: "7 days"]
    unless: [view_11467.id, view_11467.status]
  }

  join: view_11469 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11467.user_id} = ${view_11469.id} ;;
    required_joins: []
  }

  join: view_11470 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11467.account_id} = ${view_11470.account_id} ;;
    required_joins: [view_11469]
  }

  join: view_11471 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11467.category} = ${view_11471.category} ;;
  }

  access_filter: {
    field: view_11467.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11467.is_deleted} = false ;;
}
