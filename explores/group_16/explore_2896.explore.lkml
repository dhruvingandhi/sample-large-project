# Explore: explore_2896
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08689.view.lkml"
include: "/views/domain_41/view_08691.view.lkml"
include: "/views/domain_42/view_08692.view.lkml"
include: "/views/domain_43/view_08693.view.lkml"

explore: explore_2896 {
  label: "Explore Explore 2896"
  description: "Comprehensive analytics explore joining base view_08689 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08689
  
  always_filter: {
    filters: [view_08689.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08689.created_at_date: "7 days"]
    unless: [view_08689.id, view_08689.status]
  }

  join: view_08691 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08689.user_id} = ${view_08691.id} ;;
    required_joins: []
  }

  join: view_08692 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08689.account_id} = ${view_08692.account_id} ;;
    required_joins: [view_08691]
  }

  join: view_08693 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08689.category} = ${view_08693.category} ;;
  }

  access_filter: {
    field: view_08689.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08689.is_deleted} = false ;;
}
