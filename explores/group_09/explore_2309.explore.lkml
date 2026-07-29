# Explore: explore_2309
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06928.view.lkml"
include: "/views/domain_30/view_06930.view.lkml"
include: "/views/domain_31/view_06931.view.lkml"
include: "/views/domain_32/view_06932.view.lkml"

explore: explore_2309 {
  label: "Explore Explore 2309"
  description: "Comprehensive analytics explore joining base view_06928 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06928
  
  always_filter: {
    filters: [view_06928.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06928.created_at_date: "7 days"]
    unless: [view_06928.id, view_06928.status]
  }

  join: view_06930 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06928.user_id} = ${view_06930.id} ;;
    required_joins: []
  }

  join: view_06931 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06928.account_id} = ${view_06931.account_id} ;;
    required_joins: [view_06930]
  }

  join: view_06932 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06928.category} = ${view_06932.category} ;;
  }

  access_filter: {
    field: view_06928.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06928.is_deleted} = false ;;
}
