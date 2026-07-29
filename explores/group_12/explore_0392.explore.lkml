# Explore: explore_0392
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01177.view.lkml"
include: "/views/domain_29/view_01179.view.lkml"
include: "/views/domain_30/view_01180.view.lkml"
include: "/views/domain_31/view_01181.view.lkml"

explore: explore_0392 {
  label: "Explore Explore 0392"
  description: "Comprehensive analytics explore joining base view_01177 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01177
  
  always_filter: {
    filters: [view_01177.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01177.created_at_date: "7 days"]
    unless: [view_01177.id, view_01177.status]
  }

  join: view_01179 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01177.user_id} = ${view_01179.id} ;;
    required_joins: []
  }

  join: view_01180 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01177.account_id} = ${view_01180.account_id} ;;
    required_joins: [view_01179]
  }

  join: view_01181 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01177.category} = ${view_01181.category} ;;
  }

  access_filter: {
    field: view_01177.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01177.is_deleted} = false ;;
}
