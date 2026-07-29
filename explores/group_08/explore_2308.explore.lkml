# Explore: explore_2308
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06925.view.lkml"
include: "/views/domain_27/view_06927.view.lkml"
include: "/views/domain_28/view_06928.view.lkml"
include: "/views/domain_29/view_06929.view.lkml"

explore: explore_2308 {
  label: "Explore Explore 2308"
  description: "Comprehensive analytics explore joining base view_06925 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06925
  
  always_filter: {
    filters: [view_06925.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06925.created_at_date: "7 days"]
    unless: [view_06925.id, view_06925.status]
  }

  join: view_06927 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06925.user_id} = ${view_06927.id} ;;
    required_joins: []
  }

  join: view_06928 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06925.account_id} = ${view_06928.account_id} ;;
    required_joins: [view_06927]
  }

  join: view_06929 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06925.category} = ${view_06929.category} ;;
  }

  access_filter: {
    field: view_06925.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06925.is_deleted} = false ;;
}
