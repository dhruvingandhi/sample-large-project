# Explore: explore_1552
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04657.view.lkml"
include: "/views/domain_09/view_04659.view.lkml"
include: "/views/domain_10/view_04660.view.lkml"
include: "/views/domain_11/view_04661.view.lkml"

explore: explore_1552 {
  label: "Explore Explore 1552"
  description: "Comprehensive analytics explore joining base view_04657 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04657
  
  always_filter: {
    filters: [view_04657.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04657.created_at_date: "7 days"]
    unless: [view_04657.id, view_04657.status]
  }

  join: view_04659 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04657.user_id} = ${view_04659.id} ;;
    required_joins: []
  }

  join: view_04660 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04657.account_id} = ${view_04660.account_id} ;;
    required_joins: [view_04659]
  }

  join: view_04661 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04657.category} = ${view_04661.category} ;;
  }

  access_filter: {
    field: view_04657.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04657.is_deleted} = false ;;
}
