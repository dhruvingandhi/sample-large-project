# Update for 2000 file diff target
# Explore: explore_0358
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01075.view.lkml"
include: "/views/domain_27/view_01077.view.lkml"
include: "/views/domain_28/view_01078.view.lkml"
include: "/views/domain_29/view_01079.view.lkml"

explore: explore_0358 {
  label: "Explore Explore 0358"
  description: "Comprehensive analytics explore joining base view_01075 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01075
  
  always_filter: {
    filters: [view_01075.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01075.created_at_date: "7 days"]
    unless: [view_01075.id, view_01075.status]
  }

  join: view_01077 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01075.user_id} = ${view_01077.id} ;;
    required_joins: []
  }

  join: view_01078 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01075.account_id} = ${view_01078.account_id} ;;
    required_joins: [view_01077]
  }

  join: view_01079 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01075.category} = ${view_01079.category} ;;
  }

  access_filter: {
    field: view_01075.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01075.is_deleted} = false ;;
}
