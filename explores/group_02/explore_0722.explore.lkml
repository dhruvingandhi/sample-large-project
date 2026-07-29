# Explore: explore_0722
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02167.view.lkml"
include: "/views/domain_19/view_02169.view.lkml"
include: "/views/domain_20/view_02170.view.lkml"
include: "/views/domain_21/view_02171.view.lkml"

explore: explore_0722 {
  label: "Explore Explore 0722"
  description: "Comprehensive analytics explore joining base view_02167 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02167
  
  always_filter: {
    filters: [view_02167.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02167.created_at_date: "7 days"]
    unless: [view_02167.id, view_02167.status]
  }

  join: view_02169 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02167.user_id} = ${view_02169.id} ;;
    required_joins: []
  }

  join: view_02170 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02167.account_id} = ${view_02170.account_id} ;;
    required_joins: [view_02169]
  }

  join: view_02171 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02167.category} = ${view_02171.category} ;;
  }

  access_filter: {
    field: view_02167.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02167.is_deleted} = false ;;
}
