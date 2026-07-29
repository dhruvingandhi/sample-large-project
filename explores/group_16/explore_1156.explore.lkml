# Explore: explore_1156
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03469.view.lkml"
include: "/views/domain_21/view_03471.view.lkml"
include: "/views/domain_22/view_03472.view.lkml"
include: "/views/domain_23/view_03473.view.lkml"

explore: explore_1156 {
  label: "Explore Explore 1156"
  description: "Comprehensive analytics explore joining base view_03469 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03469
  
  always_filter: {
    filters: [view_03469.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03469.created_at_date: "7 days"]
    unless: [view_03469.id, view_03469.status]
  }

  join: view_03471 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03469.user_id} = ${view_03471.id} ;;
    required_joins: []
  }

  join: view_03472 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03469.account_id} = ${view_03472.account_id} ;;
    required_joins: [view_03471]
  }

  join: view_03473 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03469.category} = ${view_03473.category} ;;
  }

  access_filter: {
    field: view_03469.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03469.is_deleted} = false ;;
}
