# Explore: explore_1023
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03070.view.lkml"
include: "/views/domain_22/view_03072.view.lkml"
include: "/views/domain_23/view_03073.view.lkml"
include: "/views/domain_24/view_03074.view.lkml"

explore: explore_1023 {
  label: "Explore Explore 1023"
  description: "Comprehensive analytics explore joining base view_03070 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03070
  
  always_filter: {
    filters: [view_03070.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03070.created_at_date: "7 days"]
    unless: [view_03070.id, view_03070.status]
  }

  join: view_03072 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03070.user_id} = ${view_03072.id} ;;
    required_joins: []
  }

  join: view_03073 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03070.account_id} = ${view_03073.account_id} ;;
    required_joins: [view_03072]
  }

  join: view_03074 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03070.category} = ${view_03074.category} ;;
  }

  access_filter: {
    field: view_03070.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03070.is_deleted} = false ;;
}
