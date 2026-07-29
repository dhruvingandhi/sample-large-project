# Explore: explore_3756
# Auto-generated LookML Explore File

include: "/views/domain_19/view_11269.view.lkml"
include: "/views/domain_21/view_11271.view.lkml"
include: "/views/domain_22/view_11272.view.lkml"
include: "/views/domain_23/view_11273.view.lkml"

explore: explore_3756 {
  label: "Explore Explore 3756"
  description: "Comprehensive analytics explore joining base view_11269 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11269
  
  always_filter: {
    filters: [view_11269.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11269.created_at_date: "7 days"]
    unless: [view_11269.id, view_11269.status]
  }

  join: view_11271 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11269.user_id} = ${view_11271.id} ;;
    required_joins: []
  }

  join: view_11272 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11269.account_id} = ${view_11272.account_id} ;;
    required_joins: [view_11271]
  }

  join: view_11273 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11269.category} = ${view_11273.category} ;;
  }

  access_filter: {
    field: view_11269.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11269.is_deleted} = false ;;
}
