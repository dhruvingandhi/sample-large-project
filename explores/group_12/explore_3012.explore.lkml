# Explore: explore_3012
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09037.view.lkml"
include: "/views/domain_39/view_09039.view.lkml"
include: "/views/domain_40/view_09040.view.lkml"
include: "/views/domain_41/view_09041.view.lkml"

explore: explore_3012 {
  label: "Explore Explore 3012"
  description: "Comprehensive analytics explore joining base view_09037 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09037
  
  always_filter: {
    filters: [view_09037.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09037.created_at_date: "7 days"]
    unless: [view_09037.id, view_09037.status]
  }

  join: view_09039 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09037.user_id} = ${view_09039.id} ;;
    required_joins: []
  }

  join: view_09040 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09037.account_id} = ${view_09040.account_id} ;;
    required_joins: [view_09039]
  }

  join: view_09041 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09037.category} = ${view_09041.category} ;;
  }

  access_filter: {
    field: view_09037.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09037.is_deleted} = false ;;
}
