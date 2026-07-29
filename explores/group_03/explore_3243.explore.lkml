# Explore: explore_3243
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09730.view.lkml"
include: "/views/domain_32/view_09732.view.lkml"
include: "/views/domain_33/view_09733.view.lkml"
include: "/views/domain_34/view_09734.view.lkml"

explore: explore_3243 {
  label: "Explore Explore 3243"
  description: "Comprehensive analytics explore joining base view_09730 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09730
  
  always_filter: {
    filters: [view_09730.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09730.created_at_date: "7 days"]
    unless: [view_09730.id, view_09730.status]
  }

  join: view_09732 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09730.user_id} = ${view_09732.id} ;;
    required_joins: []
  }

  join: view_09733 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09730.account_id} = ${view_09733.account_id} ;;
    required_joins: [view_09732]
  }

  join: view_09734 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09730.category} = ${view_09734.category} ;;
  }

  access_filter: {
    field: view_09730.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09730.is_deleted} = false ;;
}
