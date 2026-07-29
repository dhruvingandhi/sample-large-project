# Explore: explore_0942
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02827.view.lkml"
include: "/views/domain_29/view_02829.view.lkml"
include: "/views/domain_30/view_02830.view.lkml"
include: "/views/domain_31/view_02831.view.lkml"

explore: explore_0942 {
  label: "Explore Explore 0942"
  description: "Comprehensive analytics explore joining base view_02827 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02827
  
  always_filter: {
    filters: [view_02827.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02827.created_at_date: "7 days"]
    unless: [view_02827.id, view_02827.status]
  }

  join: view_02829 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02827.user_id} = ${view_02829.id} ;;
    required_joins: []
  }

  join: view_02830 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02827.account_id} = ${view_02830.account_id} ;;
    required_joins: [view_02829]
  }

  join: view_02831 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02827.category} = ${view_02831.category} ;;
  }

  access_filter: {
    field: view_02827.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02827.is_deleted} = false ;;
}
