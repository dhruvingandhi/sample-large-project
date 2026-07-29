# Explore: explore_3897
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11692.view.lkml"
include: "/views/domain_44/view_11694.view.lkml"
include: "/views/domain_45/view_11695.view.lkml"
include: "/views/domain_46/view_11696.view.lkml"

explore: explore_3897 {
  label: "Explore Explore 3897"
  description: "Comprehensive analytics explore joining base view_11692 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11692
  
  always_filter: {
    filters: [view_11692.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11692.created_at_date: "7 days"]
    unless: [view_11692.id, view_11692.status]
  }

  join: view_11694 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11692.user_id} = ${view_11694.id} ;;
    required_joins: []
  }

  join: view_11695 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11692.account_id} = ${view_11695.account_id} ;;
    required_joins: [view_11694]
  }

  join: view_11696 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11692.category} = ${view_11696.category} ;;
  }

  access_filter: {
    field: view_11692.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11692.is_deleted} = false ;;
}
