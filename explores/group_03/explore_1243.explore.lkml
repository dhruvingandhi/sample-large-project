# Explore: explore_1243
# Auto-generated LookML Explore File

include: "/views/domain_30/view_03730.view.lkml"
include: "/views/domain_32/view_03732.view.lkml"
include: "/views/domain_33/view_03733.view.lkml"
include: "/views/domain_34/view_03734.view.lkml"

explore: explore_1243 {
  label: "Explore Explore 1243"
  description: "Comprehensive analytics explore joining base view_03730 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03730
  
  always_filter: {
    filters: [view_03730.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03730.created_at_date: "7 days"]
    unless: [view_03730.id, view_03730.status]
  }

  join: view_03732 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03730.user_id} = ${view_03732.id} ;;
    required_joins: []
  }

  join: view_03733 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03730.account_id} = ${view_03733.account_id} ;;
    required_joins: [view_03732]
  }

  join: view_03734 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03730.category} = ${view_03734.category} ;;
  }

  access_filter: {
    field: view_03730.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03730.is_deleted} = false ;;
}
