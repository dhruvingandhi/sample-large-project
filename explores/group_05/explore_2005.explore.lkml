# Explore: explore_2005
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06016.view.lkml"
include: "/views/domain_18/view_06018.view.lkml"
include: "/views/domain_19/view_06019.view.lkml"
include: "/views/domain_20/view_06020.view.lkml"

explore: explore_2005 {
  label: "Explore Explore 2005"
  description: "Comprehensive analytics explore joining base view_06016 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06016
  
  always_filter: {
    filters: [view_06016.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06016.created_at_date: "7 days"]
    unless: [view_06016.id, view_06016.status]
  }

  join: view_06018 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06016.user_id} = ${view_06018.id} ;;
    required_joins: []
  }

  join: view_06019 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06016.account_id} = ${view_06019.account_id} ;;
    required_joins: [view_06018]
  }

  join: view_06020 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06016.category} = ${view_06020.category} ;;
  }

  access_filter: {
    field: view_06016.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06016.is_deleted} = false ;;
}
