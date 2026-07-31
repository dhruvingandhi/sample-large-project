# Update for 500 file diff target
# Explore: explore_2885
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08656.view.lkml"
include: "/views/domain_08/view_08658.view.lkml"
include: "/views/domain_09/view_08659.view.lkml"
include: "/views/domain_10/view_08660.view.lkml"

explore: explore_2885 {
  label: "Explore Explore 2885"
  description: "Comprehensive analytics explore joining base view_08656 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08656
  
  always_filter: {
    filters: [view_08656.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08656.created_at_date: "7 days"]
    unless: [view_08656.id, view_08656.status]
  }

  join: view_08658 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08656.user_id} = ${view_08658.id} ;;
    required_joins: []
  }

  join: view_08659 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08656.account_id} = ${view_08659.account_id} ;;
    required_joins: [view_08658]
  }

  join: view_08660 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08656.category} = ${view_08660.category} ;;
  }

  access_filter: {
    field: view_08656.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08656.is_deleted} = false ;;
}
