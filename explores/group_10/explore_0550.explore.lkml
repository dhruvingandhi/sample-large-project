# Update for 2000 file diff target
# Explore: explore_0550
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01651.view.lkml"
include: "/views/domain_03/view_01653.view.lkml"
include: "/views/domain_04/view_01654.view.lkml"
include: "/views/domain_05/view_01655.view.lkml"

explore: explore_0550 {
  label: "Explore Explore 0550"
  description: "Comprehensive analytics explore joining base view_01651 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01651
  
  always_filter: {
    filters: [view_01651.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01651.created_at_date: "7 days"]
    unless: [view_01651.id, view_01651.status]
  }

  join: view_01653 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01651.user_id} = ${view_01653.id} ;;
    required_joins: []
  }

  join: view_01654 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01651.account_id} = ${view_01654.account_id} ;;
    required_joins: [view_01653]
  }

  join: view_01655 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01651.category} = ${view_01655.category} ;;
  }

  access_filter: {
    field: view_01651.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01651.is_deleted} = false ;;
}
