# Explore: explore_1613
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04840.view.lkml"
include: "/views/domain_42/view_04842.view.lkml"
include: "/views/domain_43/view_04843.view.lkml"
include: "/views/domain_44/view_04844.view.lkml"

explore: explore_1613 {
  label: "Explore Explore 1613"
  description: "Comprehensive analytics explore joining base view_04840 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04840
  
  always_filter: {
    filters: [view_04840.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04840.created_at_date: "7 days"]
    unless: [view_04840.id, view_04840.status]
  }

  join: view_04842 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04840.user_id} = ${view_04842.id} ;;
    required_joins: []
  }

  join: view_04843 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04840.account_id} = ${view_04843.account_id} ;;
    required_joins: [view_04842]
  }

  join: view_04844 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04840.category} = ${view_04844.category} ;;
  }

  access_filter: {
    field: view_04840.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04840.is_deleted} = false ;;
}
