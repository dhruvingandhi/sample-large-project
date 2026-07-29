# Explore: explore_1308
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03925.view.lkml"
include: "/views/domain_27/view_03927.view.lkml"
include: "/views/domain_28/view_03928.view.lkml"
include: "/views/domain_29/view_03929.view.lkml"

explore: explore_1308 {
  label: "Explore Explore 1308"
  description: "Comprehensive analytics explore joining base view_03925 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03925
  
  always_filter: {
    filters: [view_03925.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03925.created_at_date: "7 days"]
    unless: [view_03925.id, view_03925.status]
  }

  join: view_03927 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03925.user_id} = ${view_03927.id} ;;
    required_joins: []
  }

  join: view_03928 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03925.account_id} = ${view_03928.account_id} ;;
    required_joins: [view_03927]
  }

  join: view_03929 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03925.category} = ${view_03929.category} ;;
  }

  access_filter: {
    field: view_03925.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03925.is_deleted} = false ;;
}
