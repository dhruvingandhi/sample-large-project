# Explore: explore_3235
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09706.view.lkml"
include: "/views/domain_08/view_09708.view.lkml"
include: "/views/domain_09/view_09709.view.lkml"
include: "/views/domain_10/view_09710.view.lkml"

explore: explore_3235 {
  label: "Explore Explore 3235"
  description: "Comprehensive analytics explore joining base view_09706 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09706
  
  always_filter: {
    filters: [view_09706.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09706.created_at_date: "7 days"]
    unless: [view_09706.id, view_09706.status]
  }

  join: view_09708 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09706.user_id} = ${view_09708.id} ;;
    required_joins: []
  }

  join: view_09709 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09706.account_id} = ${view_09709.account_id} ;;
    required_joins: [view_09708]
  }

  join: view_09710 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09706.category} = ${view_09710.category} ;;
  }

  access_filter: {
    field: view_09706.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09706.is_deleted} = false ;;
}
