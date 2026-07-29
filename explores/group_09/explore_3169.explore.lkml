# Explore: explore_3169
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09508.view.lkml"
include: "/views/domain_10/view_09510.view.lkml"
include: "/views/domain_11/view_09511.view.lkml"
include: "/views/domain_12/view_09512.view.lkml"

explore: explore_3169 {
  label: "Explore Explore 3169"
  description: "Comprehensive analytics explore joining base view_09508 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09508
  
  always_filter: {
    filters: [view_09508.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09508.created_at_date: "7 days"]
    unless: [view_09508.id, view_09508.status]
  }

  join: view_09510 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09508.user_id} = ${view_09510.id} ;;
    required_joins: []
  }

  join: view_09511 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09508.account_id} = ${view_09511.account_id} ;;
    required_joins: [view_09510]
  }

  join: view_09512 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09508.category} = ${view_09512.category} ;;
  }

  access_filter: {
    field: view_09508.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09508.is_deleted} = false ;;
}
