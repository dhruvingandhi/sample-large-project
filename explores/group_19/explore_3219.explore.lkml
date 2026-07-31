# Update for 2000 file diff target
# Explore: explore_3219
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09658.view.lkml"
include: "/views/domain_10/view_09660.view.lkml"
include: "/views/domain_11/view_09661.view.lkml"
include: "/views/domain_12/view_09662.view.lkml"

explore: explore_3219 {
  label: "Explore Explore 3219"
  description: "Comprehensive analytics explore joining base view_09658 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09658
  
  always_filter: {
    filters: [view_09658.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09658.created_at_date: "7 days"]
    unless: [view_09658.id, view_09658.status]
  }

  join: view_09660 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09658.user_id} = ${view_09660.id} ;;
    required_joins: []
  }

  join: view_09661 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09658.account_id} = ${view_09661.account_id} ;;
    required_joins: [view_09660]
  }

  join: view_09662 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09658.category} = ${view_09662.category} ;;
  }

  access_filter: {
    field: view_09658.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09658.is_deleted} = false ;;
}
