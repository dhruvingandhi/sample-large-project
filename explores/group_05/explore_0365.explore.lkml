# Antigravity modified: branch dg-3
# Explore: explore_0365
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01096.view.lkml"
include: "/views/domain_48/view_01098.view.lkml"
include: "/views/domain_49/view_01099.view.lkml"
include: "/views/domain_50/view_01100.view.lkml"

explore: explore_0365 {
  label: "Explore Explore 0365"
  description: "Comprehensive analytics explore joining base view_01096 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01096
  
  always_filter: {
    filters: [view_01096.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01096.created_at_date: "7 days"]
    unless: [view_01096.id, view_01096.status]
  }

  join: view_01098 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01096.user_id} = ${view_01098.id} ;;
    required_joins: []
  }

  join: view_01099 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01096.account_id} = ${view_01099.account_id} ;;
    required_joins: [view_01098]
  }

  join: view_01100 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01096.category} = ${view_01100.category} ;;
  }

  access_filter: {
    field: view_01096.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01096.is_deleted} = false ;;
}
