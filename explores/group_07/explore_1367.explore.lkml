# Explore: explore_1367
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04102.view.lkml"
include: "/views/domain_04/view_04104.view.lkml"
include: "/views/domain_05/view_04105.view.lkml"
include: "/views/domain_06/view_04106.view.lkml"

explore: explore_1367 {
  label: "Explore Explore 1367"
  description: "Comprehensive analytics explore joining base view_04102 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04102
  
  always_filter: {
    filters: [view_04102.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04102.created_at_date: "7 days"]
    unless: [view_04102.id, view_04102.status]
  }

  join: view_04104 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04102.user_id} = ${view_04104.id} ;;
    required_joins: []
  }

  join: view_04105 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04102.account_id} = ${view_04105.account_id} ;;
    required_joins: [view_04104]
  }

  join: view_04106 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04102.category} = ${view_04106.category} ;;
  }

  access_filter: {
    field: view_04102.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04102.is_deleted} = false ;;
}
