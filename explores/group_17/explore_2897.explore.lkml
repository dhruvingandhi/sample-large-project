# Update for 2000 file diff target
# Explore: explore_2897
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08692.view.lkml"
include: "/views/domain_44/view_08694.view.lkml"
include: "/views/domain_45/view_08695.view.lkml"
include: "/views/domain_46/view_08696.view.lkml"

explore: explore_2897 {
  label: "Explore Explore 2897"
  description: "Comprehensive analytics explore joining base view_08692 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08692
  
  always_filter: {
    filters: [view_08692.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08692.created_at_date: "7 days"]
    unless: [view_08692.id, view_08692.status]
  }

  join: view_08694 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08692.user_id} = ${view_08694.id} ;;
    required_joins: []
  }

  join: view_08695 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08692.account_id} = ${view_08695.account_id} ;;
    required_joins: [view_08694]
  }

  join: view_08696 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08692.category} = ${view_08696.category} ;;
  }

  access_filter: {
    field: view_08692.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08692.is_deleted} = false ;;
}
