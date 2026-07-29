# Explore: explore_2074
# Auto-generated LookML Explore File

include: "/views/domain_23/view_06223.view.lkml"
include: "/views/domain_25/view_06225.view.lkml"
include: "/views/domain_26/view_06226.view.lkml"
include: "/views/domain_27/view_06227.view.lkml"

explore: explore_2074 {
  label: "Explore Explore 2074"
  description: "Comprehensive analytics explore joining base view_06223 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06223
  
  always_filter: {
    filters: [view_06223.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06223.created_at_date: "7 days"]
    unless: [view_06223.id, view_06223.status]
  }

  join: view_06225 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06223.user_id} = ${view_06225.id} ;;
    required_joins: []
  }

  join: view_06226 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06223.account_id} = ${view_06226.account_id} ;;
    required_joins: [view_06225]
  }

  join: view_06227 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06223.category} = ${view_06227.category} ;;
  }

  access_filter: {
    field: view_06223.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06223.is_deleted} = false ;;
}
