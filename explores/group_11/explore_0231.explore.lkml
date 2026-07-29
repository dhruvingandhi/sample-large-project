# Explore: explore_0231
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00694.view.lkml"
include: "/views/domain_46/view_00696.view.lkml"
include: "/views/domain_47/view_00697.view.lkml"
include: "/views/domain_48/view_00698.view.lkml"

explore: explore_0231 {
  label: "Explore Explore 0231"
  description: "Comprehensive analytics explore joining base view_00694 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00694
  
  always_filter: {
    filters: [view_00694.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00694.created_at_date: "7 days"]
    unless: [view_00694.id, view_00694.status]
  }

  join: view_00696 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00694.user_id} = ${view_00696.id} ;;
    required_joins: []
  }

  join: view_00697 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00694.account_id} = ${view_00697.account_id} ;;
    required_joins: [view_00696]
  }

  join: view_00698 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00694.category} = ${view_00698.category} ;;
  }

  access_filter: {
    field: view_00694.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00694.is_deleted} = false ;;
}
