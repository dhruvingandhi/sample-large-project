# Update for 2000 file diff target
# Explore: explore_0359
# Auto-generated LookML Explore File

include: "/views/domain_28/view_01078.view.lkml"
include: "/views/domain_30/view_01080.view.lkml"
include: "/views/domain_31/view_01081.view.lkml"
include: "/views/domain_32/view_01082.view.lkml"

explore: explore_0359 {
  label: "Explore Explore 0359"
  description: "Comprehensive analytics explore joining base view_01078 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01078
  
  always_filter: {
    filters: [view_01078.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01078.created_at_date: "7 days"]
    unless: [view_01078.id, view_01078.status]
  }

  join: view_01080 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01078.user_id} = ${view_01080.id} ;;
    required_joins: []
  }

  join: view_01081 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01078.account_id} = ${view_01081.account_id} ;;
    required_joins: [view_01080]
  }

  join: view_01082 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01078.category} = ${view_01082.category} ;;
  }

  access_filter: {
    field: view_01078.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01078.is_deleted} = false ;;
}
