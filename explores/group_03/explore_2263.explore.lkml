# Explore: explore_2263
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06790.view.lkml"
include: "/views/domain_42/view_06792.view.lkml"
include: "/views/domain_43/view_06793.view.lkml"
include: "/views/domain_44/view_06794.view.lkml"

explore: explore_2263 {
  label: "Explore Explore 2263"
  description: "Comprehensive analytics explore joining base view_06790 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06790
  
  always_filter: {
    filters: [view_06790.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06790.created_at_date: "7 days"]
    unless: [view_06790.id, view_06790.status]
  }

  join: view_06792 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06790.user_id} = ${view_06792.id} ;;
    required_joins: []
  }

  join: view_06793 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06790.account_id} = ${view_06793.account_id} ;;
    required_joins: [view_06792]
  }

  join: view_06794 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06790.category} = ${view_06794.category} ;;
  }

  access_filter: {
    field: view_06790.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06790.is_deleted} = false ;;
}
