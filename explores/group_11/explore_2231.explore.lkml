# Explore: explore_2231
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06694.view.lkml"
include: "/views/domain_46/view_06696.view.lkml"
include: "/views/domain_47/view_06697.view.lkml"
include: "/views/domain_48/view_06698.view.lkml"

explore: explore_2231 {
  label: "Explore Explore 2231"
  description: "Comprehensive analytics explore joining base view_06694 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06694
  
  always_filter: {
    filters: [view_06694.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06694.created_at_date: "7 days"]
    unless: [view_06694.id, view_06694.status]
  }

  join: view_06696 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06694.user_id} = ${view_06696.id} ;;
    required_joins: []
  }

  join: view_06697 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06694.account_id} = ${view_06697.account_id} ;;
    required_joins: [view_06696]
  }

  join: view_06698 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06694.category} = ${view_06698.category} ;;
  }

  access_filter: {
    field: view_06694.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06694.is_deleted} = false ;;
}
