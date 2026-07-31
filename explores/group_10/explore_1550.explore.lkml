# Update for 2000 file diff target
# Explore: explore_1550
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04651.view.lkml"
include: "/views/domain_03/view_04653.view.lkml"
include: "/views/domain_04/view_04654.view.lkml"
include: "/views/domain_05/view_04655.view.lkml"

explore: explore_1550 {
  label: "Explore Explore 1550"
  description: "Comprehensive analytics explore joining base view_04651 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04651
  
  always_filter: {
    filters: [view_04651.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04651.created_at_date: "7 days"]
    unless: [view_04651.id, view_04651.status]
  }

  join: view_04653 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04651.user_id} = ${view_04653.id} ;;
    required_joins: []
  }

  join: view_04654 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04651.account_id} = ${view_04654.account_id} ;;
    required_joins: [view_04653]
  }

  join: view_04655 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04651.category} = ${view_04655.category} ;;
  }

  access_filter: {
    field: view_04651.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04651.is_deleted} = false ;;
}
