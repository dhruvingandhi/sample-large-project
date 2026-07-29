# Explore: explore_1579
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04738.view.lkml"
include: "/views/domain_40/view_04740.view.lkml"
include: "/views/domain_41/view_04741.view.lkml"
include: "/views/domain_42/view_04742.view.lkml"

explore: explore_1579 {
  label: "Explore Explore 1579"
  description: "Comprehensive analytics explore joining base view_04738 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04738
  
  always_filter: {
    filters: [view_04738.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04738.created_at_date: "7 days"]
    unless: [view_04738.id, view_04738.status]
  }

  join: view_04740 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04738.user_id} = ${view_04740.id} ;;
    required_joins: []
  }

  join: view_04741 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04738.account_id} = ${view_04741.account_id} ;;
    required_joins: [view_04740]
  }

  join: view_04742 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04738.category} = ${view_04742.category} ;;
  }

  access_filter: {
    field: view_04738.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04738.is_deleted} = false ;;
}
