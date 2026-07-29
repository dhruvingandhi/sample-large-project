# Explore: explore_1942
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05827.view.lkml"
include: "/views/domain_29/view_05829.view.lkml"
include: "/views/domain_30/view_05830.view.lkml"
include: "/views/domain_31/view_05831.view.lkml"

explore: explore_1942 {
  label: "Explore Explore 1942"
  description: "Comprehensive analytics explore joining base view_05827 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05827
  
  always_filter: {
    filters: [view_05827.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05827.created_at_date: "7 days"]
    unless: [view_05827.id, view_05827.status]
  }

  join: view_05829 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05827.user_id} = ${view_05829.id} ;;
    required_joins: []
  }

  join: view_05830 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05827.account_id} = ${view_05830.account_id} ;;
    required_joins: [view_05829]
  }

  join: view_05831 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05827.category} = ${view_05831.category} ;;
  }

  access_filter: {
    field: view_05827.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05827.is_deleted} = false ;;
}
