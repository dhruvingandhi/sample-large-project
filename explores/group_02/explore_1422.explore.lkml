# Explore: explore_1422
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04267.view.lkml"
include: "/views/domain_19/view_04269.view.lkml"
include: "/views/domain_20/view_04270.view.lkml"
include: "/views/domain_21/view_04271.view.lkml"

explore: explore_1422 {
  label: "Explore Explore 1422"
  description: "Comprehensive analytics explore joining base view_04267 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04267
  
  always_filter: {
    filters: [view_04267.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04267.created_at_date: "7 days"]
    unless: [view_04267.id, view_04267.status]
  }

  join: view_04269 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04267.user_id} = ${view_04269.id} ;;
    required_joins: []
  }

  join: view_04270 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04267.account_id} = ${view_04270.account_id} ;;
    required_joins: [view_04269]
  }

  join: view_04271 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04267.category} = ${view_04271.category} ;;
  }

  access_filter: {
    field: view_04267.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04267.is_deleted} = false ;;
}
