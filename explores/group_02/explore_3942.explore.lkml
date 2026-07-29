# Explore: explore_3942
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11827.view.lkml"
include: "/views/domain_29/view_11829.view.lkml"
include: "/views/domain_30/view_11830.view.lkml"
include: "/views/domain_31/view_11831.view.lkml"

explore: explore_3942 {
  label: "Explore Explore 3942"
  description: "Comprehensive analytics explore joining base view_11827 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11827
  
  always_filter: {
    filters: [view_11827.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11827.created_at_date: "7 days"]
    unless: [view_11827.id, view_11827.status]
  }

  join: view_11829 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11827.user_id} = ${view_11829.id} ;;
    required_joins: []
  }

  join: view_11830 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11827.account_id} = ${view_11830.account_id} ;;
    required_joins: [view_11829]
  }

  join: view_11831 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11827.category} = ${view_11831.category} ;;
  }

  access_filter: {
    field: view_11827.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11827.is_deleted} = false ;;
}
