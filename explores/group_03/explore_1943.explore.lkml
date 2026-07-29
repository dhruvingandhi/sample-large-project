# Explore: explore_1943
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05830.view.lkml"
include: "/views/domain_32/view_05832.view.lkml"
include: "/views/domain_33/view_05833.view.lkml"
include: "/views/domain_34/view_05834.view.lkml"

explore: explore_1943 {
  label: "Explore Explore 1943"
  description: "Comprehensive analytics explore joining base view_05830 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05830
  
  always_filter: {
    filters: [view_05830.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05830.created_at_date: "7 days"]
    unless: [view_05830.id, view_05830.status]
  }

  join: view_05832 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05830.user_id} = ${view_05832.id} ;;
    required_joins: []
  }

  join: view_05833 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05830.account_id} = ${view_05833.account_id} ;;
    required_joins: [view_05832]
  }

  join: view_05834 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05830.category} = ${view_05834.category} ;;
  }

  access_filter: {
    field: view_05830.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05830.is_deleted} = false ;;
}
