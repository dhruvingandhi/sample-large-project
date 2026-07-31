# Update for 2000 file diff target
# Explore: explore_0560
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01681.view.lkml"
include: "/views/domain_33/view_01683.view.lkml"
include: "/views/domain_34/view_01684.view.lkml"
include: "/views/domain_35/view_01685.view.lkml"

explore: explore_0560 {
  label: "Explore Explore 0560"
  description: "Comprehensive analytics explore joining base view_01681 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01681
  
  always_filter: {
    filters: [view_01681.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01681.created_at_date: "7 days"]
    unless: [view_01681.id, view_01681.status]
  }

  join: view_01683 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01681.user_id} = ${view_01683.id} ;;
    required_joins: []
  }

  join: view_01684 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01681.account_id} = ${view_01684.account_id} ;;
    required_joins: [view_01683]
  }

  join: view_01685 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01681.category} = ${view_01685.category} ;;
  }

  access_filter: {
    field: view_01681.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01681.is_deleted} = false ;;
}
