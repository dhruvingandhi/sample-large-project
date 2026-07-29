# Explore: explore_1897
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05692.view.lkml"
include: "/views/domain_44/view_05694.view.lkml"
include: "/views/domain_45/view_05695.view.lkml"
include: "/views/domain_46/view_05696.view.lkml"

explore: explore_1897 {
  label: "Explore Explore 1897"
  description: "Comprehensive analytics explore joining base view_05692 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05692
  
  always_filter: {
    filters: [view_05692.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05692.created_at_date: "7 days"]
    unless: [view_05692.id, view_05692.status]
  }

  join: view_05694 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05692.user_id} = ${view_05694.id} ;;
    required_joins: []
  }

  join: view_05695 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05692.account_id} = ${view_05695.account_id} ;;
    required_joins: [view_05694]
  }

  join: view_05696 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05692.category} = ${view_05696.category} ;;
  }

  access_filter: {
    field: view_05692.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05692.is_deleted} = false ;;
}
