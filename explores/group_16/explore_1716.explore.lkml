# Explore: explore_1716
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05149.view.lkml"
include: "/views/domain_01/view_05151.view.lkml"
include: "/views/domain_02/view_05152.view.lkml"
include: "/views/domain_03/view_05153.view.lkml"

explore: explore_1716 {
  label: "Explore Explore 1716"
  description: "Comprehensive analytics explore joining base view_05149 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05149
  
  always_filter: {
    filters: [view_05149.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05149.created_at_date: "7 days"]
    unless: [view_05149.id, view_05149.status]
  }

  join: view_05151 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05149.user_id} = ${view_05151.id} ;;
    required_joins: []
  }

  join: view_05152 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05149.account_id} = ${view_05152.account_id} ;;
    required_joins: [view_05151]
  }

  join: view_05153 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05149.category} = ${view_05153.category} ;;
  }

  access_filter: {
    field: view_05149.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05149.is_deleted} = false ;;
}
