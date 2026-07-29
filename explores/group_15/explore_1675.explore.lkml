# Explore: explore_1675
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05026.view.lkml"
include: "/views/domain_28/view_05028.view.lkml"
include: "/views/domain_29/view_05029.view.lkml"
include: "/views/domain_30/view_05030.view.lkml"

explore: explore_1675 {
  label: "Explore Explore 1675"
  description: "Comprehensive analytics explore joining base view_05026 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05026
  
  always_filter: {
    filters: [view_05026.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05026.created_at_date: "7 days"]
    unless: [view_05026.id, view_05026.status]
  }

  join: view_05028 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05026.user_id} = ${view_05028.id} ;;
    required_joins: []
  }

  join: view_05029 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05026.account_id} = ${view_05029.account_id} ;;
    required_joins: [view_05028]
  }

  join: view_05030 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05026.category} = ${view_05030.category} ;;
  }

  access_filter: {
    field: view_05026.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05026.is_deleted} = false ;;
}
