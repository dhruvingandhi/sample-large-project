# Update for 500 file diff target
# Explore: explore_3905
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11716.view.lkml"
include: "/views/domain_18/view_11718.view.lkml"
include: "/views/domain_19/view_11719.view.lkml"
include: "/views/domain_20/view_11720.view.lkml"

explore: explore_3905 {
  label: "Explore Explore 3905"
  description: "Comprehensive analytics explore joining base view_11716 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11716
  
  always_filter: {
    filters: [view_11716.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11716.created_at_date: "7 days"]
    unless: [view_11716.id, view_11716.status]
  }

  join: view_11718 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11716.user_id} = ${view_11718.id} ;;
    required_joins: []
  }

  join: view_11719 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11716.account_id} = ${view_11719.account_id} ;;
    required_joins: [view_11718]
  }

  join: view_11720 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11716.category} = ${view_11720.category} ;;
  }

  access_filter: {
    field: view_11716.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11716.is_deleted} = false ;;
}
