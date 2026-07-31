# Update for 500 file diff target
# Explore: explore_1905
# Auto-generated LookML Explore File

include: "/views/domain_16/view_05716.view.lkml"
include: "/views/domain_18/view_05718.view.lkml"
include: "/views/domain_19/view_05719.view.lkml"
include: "/views/domain_20/view_05720.view.lkml"

explore: explore_1905 {
  label: "Explore Explore 1905"
  description: "Comprehensive analytics explore joining base view_05716 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05716
  
  always_filter: {
    filters: [view_05716.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05716.created_at_date: "7 days"]
    unless: [view_05716.id, view_05716.status]
  }

  join: view_05718 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05716.user_id} = ${view_05718.id} ;;
    required_joins: []
  }

  join: view_05719 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05716.account_id} = ${view_05719.account_id} ;;
    required_joins: [view_05718]
  }

  join: view_05720 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05716.category} = ${view_05720.category} ;;
  }

  access_filter: {
    field: view_05716.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05716.is_deleted} = false ;;
}
