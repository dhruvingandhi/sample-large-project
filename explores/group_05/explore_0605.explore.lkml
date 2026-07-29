# Explore: explore_0605
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01816.view.lkml"
include: "/views/domain_18/view_01818.view.lkml"
include: "/views/domain_19/view_01819.view.lkml"
include: "/views/domain_20/view_01820.view.lkml"

explore: explore_0605 {
  label: "Explore Explore 0605"
  description: "Comprehensive analytics explore joining base view_01816 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01816
  
  always_filter: {
    filters: [view_01816.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01816.created_at_date: "7 days"]
    unless: [view_01816.id, view_01816.status]
  }

  join: view_01818 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01816.user_id} = ${view_01818.id} ;;
    required_joins: []
  }

  join: view_01819 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01816.account_id} = ${view_01819.account_id} ;;
    required_joins: [view_01818]
  }

  join: view_01820 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01816.category} = ${view_01820.category} ;;
  }

  access_filter: {
    field: view_01816.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01816.is_deleted} = false ;;
}
