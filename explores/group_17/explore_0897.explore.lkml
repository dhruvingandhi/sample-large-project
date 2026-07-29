# Explore: explore_0897
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02692.view.lkml"
include: "/views/domain_44/view_02694.view.lkml"
include: "/views/domain_45/view_02695.view.lkml"
include: "/views/domain_46/view_02696.view.lkml"

explore: explore_0897 {
  label: "Explore Explore 0897"
  description: "Comprehensive analytics explore joining base view_02692 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02692
  
  always_filter: {
    filters: [view_02692.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02692.created_at_date: "7 days"]
    unless: [view_02692.id, view_02692.status]
  }

  join: view_02694 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02692.user_id} = ${view_02694.id} ;;
    required_joins: []
  }

  join: view_02695 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02692.account_id} = ${view_02695.account_id} ;;
    required_joins: [view_02694]
  }

  join: view_02696 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02692.category} = ${view_02696.category} ;;
  }

  access_filter: {
    field: view_02692.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02692.is_deleted} = false ;;
}
