# Explore: explore_0683
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02050.view.lkml"
include: "/views/domain_02/view_02052.view.lkml"
include: "/views/domain_03/view_02053.view.lkml"
include: "/views/domain_04/view_02054.view.lkml"

explore: explore_0683 {
  label: "Explore Explore 0683"
  description: "Comprehensive analytics explore joining base view_02050 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02050
  
  always_filter: {
    filters: [view_02050.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02050.created_at_date: "7 days"]
    unless: [view_02050.id, view_02050.status]
  }

  join: view_02052 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02050.user_id} = ${view_02052.id} ;;
    required_joins: []
  }

  join: view_02053 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02050.account_id} = ${view_02053.account_id} ;;
    required_joins: [view_02052]
  }

  join: view_02054 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02050.category} = ${view_02054.category} ;;
  }

  access_filter: {
    field: view_02050.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02050.is_deleted} = false ;;
}
