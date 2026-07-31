# Update for 500 file diff target
# Explore: explore_2445
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07336.view.lkml"
include: "/views/domain_38/view_07338.view.lkml"
include: "/views/domain_39/view_07339.view.lkml"
include: "/views/domain_40/view_07340.view.lkml"

explore: explore_2445 {
  label: "Explore Explore 2445"
  description: "Comprehensive analytics explore joining base view_07336 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07336
  
  always_filter: {
    filters: [view_07336.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07336.created_at_date: "7 days"]
    unless: [view_07336.id, view_07336.status]
  }

  join: view_07338 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07336.user_id} = ${view_07338.id} ;;
    required_joins: []
  }

  join: view_07339 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07336.account_id} = ${view_07339.account_id} ;;
    required_joins: [view_07338]
  }

  join: view_07340 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07336.category} = ${view_07340.category} ;;
  }

  access_filter: {
    field: view_07336.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07336.is_deleted} = false ;;
}
