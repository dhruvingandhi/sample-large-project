# Explore: explore_0901
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02704.view.lkml"
include: "/views/domain_06/view_02706.view.lkml"
include: "/views/domain_07/view_02707.view.lkml"
include: "/views/domain_08/view_02708.view.lkml"

explore: explore_0901 {
  label: "Explore Explore 0901"
  description: "Comprehensive analytics explore joining base view_02704 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02704
  
  always_filter: {
    filters: [view_02704.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02704.created_at_date: "7 days"]
    unless: [view_02704.id, view_02704.status]
  }

  join: view_02706 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02704.user_id} = ${view_02706.id} ;;
    required_joins: []
  }

  join: view_02707 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02704.account_id} = ${view_02707.account_id} ;;
    required_joins: [view_02706]
  }

  join: view_02708 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02704.category} = ${view_02708.category} ;;
  }

  access_filter: {
    field: view_02704.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02704.is_deleted} = false ;;
}
