# Explore: explore_0561
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01684.view.lkml"
include: "/views/domain_36/view_01686.view.lkml"
include: "/views/domain_37/view_01687.view.lkml"
include: "/views/domain_38/view_01688.view.lkml"

explore: explore_0561 {
  label: "Explore Explore 0561"
  description: "Comprehensive analytics explore joining base view_01684 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01684
  
  always_filter: {
    filters: [view_01684.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01684.created_at_date: "7 days"]
    unless: [view_01684.id, view_01684.status]
  }

  join: view_01686 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01684.user_id} = ${view_01686.id} ;;
    required_joins: []
  }

  join: view_01687 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01684.account_id} = ${view_01687.account_id} ;;
    required_joins: [view_01686]
  }

  join: view_01688 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01684.category} = ${view_01688.category} ;;
  }

  access_filter: {
    field: view_01684.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01684.is_deleted} = false ;;
}
