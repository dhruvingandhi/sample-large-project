# Update for 500 file diff target
# Explore: explore_2985
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08956.view.lkml"
include: "/views/domain_08/view_08958.view.lkml"
include: "/views/domain_09/view_08959.view.lkml"
include: "/views/domain_10/view_08960.view.lkml"

explore: explore_2985 {
  label: "Explore Explore 2985"
  description: "Comprehensive analytics explore joining base view_08956 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08956
  
  always_filter: {
    filters: [view_08956.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08956.created_at_date: "7 days"]
    unless: [view_08956.id, view_08956.status]
  }

  join: view_08958 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08956.user_id} = ${view_08958.id} ;;
    required_joins: []
  }

  join: view_08959 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08956.account_id} = ${view_08959.account_id} ;;
    required_joins: [view_08958]
  }

  join: view_08960 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08956.category} = ${view_08960.category} ;;
  }

  access_filter: {
    field: view_08956.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08956.is_deleted} = false ;;
}
