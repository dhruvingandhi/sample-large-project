# Explore: explore_1263
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03790.view.lkml"
include: "/views/domain_42/view_03792.view.lkml"
include: "/views/domain_43/view_03793.view.lkml"
include: "/views/domain_44/view_03794.view.lkml"

explore: explore_1263 {
  label: "Explore Explore 1263"
  description: "Comprehensive analytics explore joining base view_03790 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03790
  
  always_filter: {
    filters: [view_03790.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03790.created_at_date: "7 days"]
    unless: [view_03790.id, view_03790.status]
  }

  join: view_03792 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03790.user_id} = ${view_03792.id} ;;
    required_joins: []
  }

  join: view_03793 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03790.account_id} = ${view_03793.account_id} ;;
    required_joins: [view_03792]
  }

  join: view_03794 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03790.category} = ${view_03794.category} ;;
  }

  access_filter: {
    field: view_03790.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03790.is_deleted} = false ;;
}
