# Explore: explore_0411
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01234.view.lkml"
include: "/views/domain_36/view_01236.view.lkml"
include: "/views/domain_37/view_01237.view.lkml"
include: "/views/domain_38/view_01238.view.lkml"

explore: explore_0411 {
  label: "Explore Explore 0411"
  description: "Comprehensive analytics explore joining base view_01234 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01234
  
  always_filter: {
    filters: [view_01234.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01234.created_at_date: "7 days"]
    unless: [view_01234.id, view_01234.status]
  }

  join: view_01236 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01234.user_id} = ${view_01236.id} ;;
    required_joins: []
  }

  join: view_01237 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01234.account_id} = ${view_01237.account_id} ;;
    required_joins: [view_01236]
  }

  join: view_01238 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01234.category} = ${view_01238.category} ;;
  }

  access_filter: {
    field: view_01234.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01234.is_deleted} = false ;;
}
