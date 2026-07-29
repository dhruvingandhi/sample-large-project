# Explore: explore_2132
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06397.view.lkml"
include: "/views/domain_49/view_06399.view.lkml"
include: "/views/domain_50/view_06400.view.lkml"
include: "/views/domain_01/view_06401.view.lkml"

explore: explore_2132 {
  label: "Explore Explore 2132"
  description: "Comprehensive analytics explore joining base view_06397 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06397
  
  always_filter: {
    filters: [view_06397.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06397.created_at_date: "7 days"]
    unless: [view_06397.id, view_06397.status]
  }

  join: view_06399 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06397.user_id} = ${view_06399.id} ;;
    required_joins: []
  }

  join: view_06400 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06397.account_id} = ${view_06400.account_id} ;;
    required_joins: [view_06399]
  }

  join: view_06401 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06397.category} = ${view_06401.category} ;;
  }

  access_filter: {
    field: view_06397.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06397.is_deleted} = false ;;
}
