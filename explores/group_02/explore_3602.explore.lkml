# Update for 500 file diff target
# Explore: explore_3602
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10807.view.lkml"
include: "/views/domain_09/view_10809.view.lkml"
include: "/views/domain_10/view_10810.view.lkml"
include: "/views/domain_11/view_10811.view.lkml"

explore: explore_3602 {
  label: "Explore Explore 3602"
  description: "Comprehensive analytics explore joining base view_10807 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10807
  
  always_filter: {
    filters: [view_10807.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10807.created_at_date: "7 days"]
    unless: [view_10807.id, view_10807.status]
  }

  join: view_10809 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10807.user_id} = ${view_10809.id} ;;
    required_joins: []
  }

  join: view_10810 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10807.account_id} = ${view_10810.account_id} ;;
    required_joins: [view_10809]
  }

  join: view_10811 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10807.category} = ${view_10811.category} ;;
  }

  access_filter: {
    field: view_10807.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10807.is_deleted} = false ;;
}
