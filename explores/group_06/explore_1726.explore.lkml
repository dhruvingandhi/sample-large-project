# Explore: explore_1726
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05179.view.lkml"
include: "/views/domain_31/view_05181.view.lkml"
include: "/views/domain_32/view_05182.view.lkml"
include: "/views/domain_33/view_05183.view.lkml"

explore: explore_1726 {
  label: "Explore Explore 1726"
  description: "Comprehensive analytics explore joining base view_05179 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05179
  
  always_filter: {
    filters: [view_05179.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05179.created_at_date: "7 days"]
    unless: [view_05179.id, view_05179.status]
  }

  join: view_05181 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05179.user_id} = ${view_05181.id} ;;
    required_joins: []
  }

  join: view_05182 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05179.account_id} = ${view_05182.account_id} ;;
    required_joins: [view_05181]
  }

  join: view_05183 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05179.category} = ${view_05183.category} ;;
  }

  access_filter: {
    field: view_05179.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05179.is_deleted} = false ;;
}
