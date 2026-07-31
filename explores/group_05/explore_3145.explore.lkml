# Update for 500 file diff target
# Explore: explore_3145
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09436.view.lkml"
include: "/views/domain_38/view_09438.view.lkml"
include: "/views/domain_39/view_09439.view.lkml"
include: "/views/domain_40/view_09440.view.lkml"

explore: explore_3145 {
  label: "Explore Explore 3145"
  description: "Comprehensive analytics explore joining base view_09436 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09436
  
  always_filter: {
    filters: [view_09436.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09436.created_at_date: "7 days"]
    unless: [view_09436.id, view_09436.status]
  }

  join: view_09438 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09436.user_id} = ${view_09438.id} ;;
    required_joins: []
  }

  join: view_09439 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09436.account_id} = ${view_09439.account_id} ;;
    required_joins: [view_09438]
  }

  join: view_09440 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09436.category} = ${view_09440.category} ;;
  }

  access_filter: {
    field: view_09436.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09436.is_deleted} = false ;;
}
