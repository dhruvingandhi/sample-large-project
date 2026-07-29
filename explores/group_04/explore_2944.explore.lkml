# Explore: explore_2944
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08833.view.lkml"
include: "/views/domain_35/view_08835.view.lkml"
include: "/views/domain_36/view_08836.view.lkml"
include: "/views/domain_37/view_08837.view.lkml"

explore: explore_2944 {
  label: "Explore Explore 2944"
  description: "Comprehensive analytics explore joining base view_08833 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08833
  
  always_filter: {
    filters: [view_08833.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08833.created_at_date: "7 days"]
    unless: [view_08833.id, view_08833.status]
  }

  join: view_08835 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08833.user_id} = ${view_08835.id} ;;
    required_joins: []
  }

  join: view_08836 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08833.account_id} = ${view_08836.account_id} ;;
    required_joins: [view_08835]
  }

  join: view_08837 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08833.category} = ${view_08837.category} ;;
  }

  access_filter: {
    field: view_08833.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08833.is_deleted} = false ;;
}
