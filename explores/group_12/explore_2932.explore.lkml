# Explore: explore_2932
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08797.view.lkml"
include: "/views/domain_49/view_08799.view.lkml"
include: "/views/domain_50/view_08800.view.lkml"
include: "/views/domain_01/view_08801.view.lkml"

explore: explore_2932 {
  label: "Explore Explore 2932"
  description: "Comprehensive analytics explore joining base view_08797 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08797
  
  always_filter: {
    filters: [view_08797.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08797.created_at_date: "7 days"]
    unless: [view_08797.id, view_08797.status]
  }

  join: view_08799 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08797.user_id} = ${view_08799.id} ;;
    required_joins: []
  }

  join: view_08800 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08797.account_id} = ${view_08800.account_id} ;;
    required_joins: [view_08799]
  }

  join: view_08801 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08797.category} = ${view_08801.category} ;;
  }

  access_filter: {
    field: view_08797.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08797.is_deleted} = false ;;
}
