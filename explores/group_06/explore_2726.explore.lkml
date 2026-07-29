# Explore: explore_2726
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08179.view.lkml"
include: "/views/domain_31/view_08181.view.lkml"
include: "/views/domain_32/view_08182.view.lkml"
include: "/views/domain_33/view_08183.view.lkml"

explore: explore_2726 {
  label: "Explore Explore 2726"
  description: "Comprehensive analytics explore joining base view_08179 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08179
  
  always_filter: {
    filters: [view_08179.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08179.created_at_date: "7 days"]
    unless: [view_08179.id, view_08179.status]
  }

  join: view_08181 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08179.user_id} = ${view_08181.id} ;;
    required_joins: []
  }

  join: view_08182 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08179.account_id} = ${view_08182.account_id} ;;
    required_joins: [view_08181]
  }

  join: view_08183 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08179.category} = ${view_08183.category} ;;
  }

  access_filter: {
    field: view_08179.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08179.is_deleted} = false ;;
}
