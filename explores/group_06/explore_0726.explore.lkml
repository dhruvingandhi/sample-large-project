# Explore: explore_0726
# Auto-generated LookML Explore File

include: "/views/domain_29/view_02179.view.lkml"
include: "/views/domain_31/view_02181.view.lkml"
include: "/views/domain_32/view_02182.view.lkml"
include: "/views/domain_33/view_02183.view.lkml"

explore: explore_0726 {
  label: "Explore Explore 0726"
  description: "Comprehensive analytics explore joining base view_02179 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02179
  
  always_filter: {
    filters: [view_02179.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02179.created_at_date: "7 days"]
    unless: [view_02179.id, view_02179.status]
  }

  join: view_02181 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02179.user_id} = ${view_02181.id} ;;
    required_joins: []
  }

  join: view_02182 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02179.account_id} = ${view_02182.account_id} ;;
    required_joins: [view_02181]
  }

  join: view_02183 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02179.category} = ${view_02183.category} ;;
  }

  access_filter: {
    field: view_02179.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02179.is_deleted} = false ;;
}
