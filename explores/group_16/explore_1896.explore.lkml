# Explore: explore_1896
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05689.view.lkml"
include: "/views/domain_41/view_05691.view.lkml"
include: "/views/domain_42/view_05692.view.lkml"
include: "/views/domain_43/view_05693.view.lkml"

explore: explore_1896 {
  label: "Explore Explore 1896"
  description: "Comprehensive analytics explore joining base view_05689 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05689
  
  always_filter: {
    filters: [view_05689.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05689.created_at_date: "7 days"]
    unless: [view_05689.id, view_05689.status]
  }

  join: view_05691 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05689.user_id} = ${view_05691.id} ;;
    required_joins: []
  }

  join: view_05692 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05689.account_id} = ${view_05692.account_id} ;;
    required_joins: [view_05691]
  }

  join: view_05693 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05689.category} = ${view_05693.category} ;;
  }

  access_filter: {
    field: view_05689.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05689.is_deleted} = false ;;
}
