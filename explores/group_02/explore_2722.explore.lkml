# Explore: explore_2722
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08167.view.lkml"
include: "/views/domain_19/view_08169.view.lkml"
include: "/views/domain_20/view_08170.view.lkml"
include: "/views/domain_21/view_08171.view.lkml"

explore: explore_2722 {
  label: "Explore Explore 2722"
  description: "Comprehensive analytics explore joining base view_08167 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08167
  
  always_filter: {
    filters: [view_08167.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08167.created_at_date: "7 days"]
    unless: [view_08167.id, view_08167.status]
  }

  join: view_08169 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08167.user_id} = ${view_08169.id} ;;
    required_joins: []
  }

  join: view_08170 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08167.account_id} = ${view_08170.account_id} ;;
    required_joins: [view_08169]
  }

  join: view_08171 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08167.category} = ${view_08171.category} ;;
  }

  access_filter: {
    field: view_08167.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08167.is_deleted} = false ;;
}
