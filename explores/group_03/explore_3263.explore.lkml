# Explore: explore_3263
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09790.view.lkml"
include: "/views/domain_42/view_09792.view.lkml"
include: "/views/domain_43/view_09793.view.lkml"
include: "/views/domain_44/view_09794.view.lkml"

explore: explore_3263 {
  label: "Explore Explore 3263"
  description: "Comprehensive analytics explore joining base view_09790 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09790
  
  always_filter: {
    filters: [view_09790.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09790.created_at_date: "7 days"]
    unless: [view_09790.id, view_09790.status]
  }

  join: view_09792 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09790.user_id} = ${view_09792.id} ;;
    required_joins: []
  }

  join: view_09793 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09790.account_id} = ${view_09793.account_id} ;;
    required_joins: [view_09792]
  }

  join: view_09794 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09790.category} = ${view_09794.category} ;;
  }

  access_filter: {
    field: view_09790.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09790.is_deleted} = false ;;
}
