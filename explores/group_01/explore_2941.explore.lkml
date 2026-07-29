# Explore: explore_2941
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08824.view.lkml"
include: "/views/domain_26/view_08826.view.lkml"
include: "/views/domain_27/view_08827.view.lkml"
include: "/views/domain_28/view_08828.view.lkml"

explore: explore_2941 {
  label: "Explore Explore 2941"
  description: "Comprehensive analytics explore joining base view_08824 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08824
  
  always_filter: {
    filters: [view_08824.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08824.created_at_date: "7 days"]
    unless: [view_08824.id, view_08824.status]
  }

  join: view_08826 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08824.user_id} = ${view_08826.id} ;;
    required_joins: []
  }

  join: view_08827 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08824.account_id} = ${view_08827.account_id} ;;
    required_joins: [view_08826]
  }

  join: view_08828 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08824.category} = ${view_08828.category} ;;
  }

  access_filter: {
    field: view_08824.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08824.is_deleted} = false ;;
}
