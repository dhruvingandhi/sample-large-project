# Explore: explore_1231
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03694.view.lkml"
include: "/views/domain_46/view_03696.view.lkml"
include: "/views/domain_47/view_03697.view.lkml"
include: "/views/domain_48/view_03698.view.lkml"

explore: explore_1231 {
  label: "Explore Explore 1231"
  description: "Comprehensive analytics explore joining base view_03694 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03694
  
  always_filter: {
    filters: [view_03694.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03694.created_at_date: "7 days"]
    unless: [view_03694.id, view_03694.status]
  }

  join: view_03696 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03694.user_id} = ${view_03696.id} ;;
    required_joins: []
  }

  join: view_03697 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03694.account_id} = ${view_03697.account_id} ;;
    required_joins: [view_03696]
  }

  join: view_03698 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03694.category} = ${view_03698.category} ;;
  }

  access_filter: {
    field: view_03694.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03694.is_deleted} = false ;;
}
