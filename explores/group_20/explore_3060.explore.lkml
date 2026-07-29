# Explore: explore_3060
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09181.view.lkml"
include: "/views/domain_33/view_09183.view.lkml"
include: "/views/domain_34/view_09184.view.lkml"
include: "/views/domain_35/view_09185.view.lkml"

explore: explore_3060 {
  label: "Explore Explore 3060"
  description: "Comprehensive analytics explore joining base view_09181 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09181
  
  always_filter: {
    filters: [view_09181.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09181.created_at_date: "7 days"]
    unless: [view_09181.id, view_09181.status]
  }

  join: view_09183 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09181.user_id} = ${view_09183.id} ;;
    required_joins: []
  }

  join: view_09184 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09181.account_id} = ${view_09184.account_id} ;;
    required_joins: [view_09183]
  }

  join: view_09185 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09181.category} = ${view_09185.category} ;;
  }

  access_filter: {
    field: view_09181.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09181.is_deleted} = false ;;
}
