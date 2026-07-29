# Explore: explore_0756
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02269.view.lkml"
include: "/views/domain_21/view_02271.view.lkml"
include: "/views/domain_22/view_02272.view.lkml"
include: "/views/domain_23/view_02273.view.lkml"

explore: explore_0756 {
  label: "Explore Explore 0756"
  description: "Comprehensive analytics explore joining base view_02269 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02269
  
  always_filter: {
    filters: [view_02269.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02269.created_at_date: "7 days"]
    unless: [view_02269.id, view_02269.status]
  }

  join: view_02271 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02269.user_id} = ${view_02271.id} ;;
    required_joins: []
  }

  join: view_02272 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02269.account_id} = ${view_02272.account_id} ;;
    required_joins: [view_02271]
  }

  join: view_02273 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02269.category} = ${view_02273.category} ;;
  }

  access_filter: {
    field: view_02269.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02269.is_deleted} = false ;;
}
