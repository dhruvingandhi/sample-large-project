# Update for 2000 file diff target
# Explore: explore_2550
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07651.view.lkml"
include: "/views/domain_03/view_07653.view.lkml"
include: "/views/domain_04/view_07654.view.lkml"
include: "/views/domain_05/view_07655.view.lkml"

explore: explore_2550 {
  label: "Explore Explore 2550"
  description: "Comprehensive analytics explore joining base view_07651 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07651
  
  always_filter: {
    filters: [view_07651.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07651.created_at_date: "7 days"]
    unless: [view_07651.id, view_07651.status]
  }

  join: view_07653 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07651.user_id} = ${view_07653.id} ;;
    required_joins: []
  }

  join: view_07654 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07651.account_id} = ${view_07654.account_id} ;;
    required_joins: [view_07653]
  }

  join: view_07655 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07651.category} = ${view_07655.category} ;;
  }

  access_filter: {
    field: view_07651.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07651.is_deleted} = false ;;
}
