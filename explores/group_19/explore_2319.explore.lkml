# Update for 2000 file diff target
# Explore: explore_2319
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06958.view.lkml"
include: "/views/domain_10/view_06960.view.lkml"
include: "/views/domain_11/view_06961.view.lkml"
include: "/views/domain_12/view_06962.view.lkml"

explore: explore_2319 {
  label: "Explore Explore 2319"
  description: "Comprehensive analytics explore joining base view_06958 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06958
  
  always_filter: {
    filters: [view_06958.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06958.created_at_date: "7 days"]
    unless: [view_06958.id, view_06958.status]
  }

  join: view_06960 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06958.user_id} = ${view_06960.id} ;;
    required_joins: []
  }

  join: view_06961 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06958.account_id} = ${view_06961.account_id} ;;
    required_joins: [view_06960]
  }

  join: view_06962 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06958.category} = ${view_06962.category} ;;
  }

  access_filter: {
    field: view_06958.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06958.is_deleted} = false ;;
}
