# Update for 2000 file diff target
# Explore: explore_3550
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10651.view.lkml"
include: "/views/domain_03/view_10653.view.lkml"
include: "/views/domain_04/view_10654.view.lkml"
include: "/views/domain_05/view_10655.view.lkml"

explore: explore_3550 {
  label: "Explore Explore 3550"
  description: "Comprehensive analytics explore joining base view_10651 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10651
  
  always_filter: {
    filters: [view_10651.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10651.created_at_date: "7 days"]
    unless: [view_10651.id, view_10651.status]
  }

  join: view_10653 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10651.user_id} = ${view_10653.id} ;;
    required_joins: []
  }

  join: view_10654 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10651.account_id} = ${view_10654.account_id} ;;
    required_joins: [view_10653]
  }

  join: view_10655 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10651.category} = ${view_10655.category} ;;
  }

  access_filter: {
    field: view_10651.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10651.is_deleted} = false ;;
}
