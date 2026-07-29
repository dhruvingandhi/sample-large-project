# Explore: explore_1311
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03934.view.lkml"
include: "/views/domain_36/view_03936.view.lkml"
include: "/views/domain_37/view_03937.view.lkml"
include: "/views/domain_38/view_03938.view.lkml"

explore: explore_1311 {
  label: "Explore Explore 1311"
  description: "Comprehensive analytics explore joining base view_03934 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03934
  
  always_filter: {
    filters: [view_03934.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03934.created_at_date: "7 days"]
    unless: [view_03934.id, view_03934.status]
  }

  join: view_03936 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03934.user_id} = ${view_03936.id} ;;
    required_joins: []
  }

  join: view_03937 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03934.account_id} = ${view_03937.account_id} ;;
    required_joins: [view_03936]
  }

  join: view_03938 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03934.category} = ${view_03938.category} ;;
  }

  access_filter: {
    field: view_03934.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03934.is_deleted} = false ;;
}
