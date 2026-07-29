# Explore: explore_3901
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11704.view.lkml"
include: "/views/domain_06/view_11706.view.lkml"
include: "/views/domain_07/view_11707.view.lkml"
include: "/views/domain_08/view_11708.view.lkml"

explore: explore_3901 {
  label: "Explore Explore 3901"
  description: "Comprehensive analytics explore joining base view_11704 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11704
  
  always_filter: {
    filters: [view_11704.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11704.created_at_date: "7 days"]
    unless: [view_11704.id, view_11704.status]
  }

  join: view_11706 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11704.user_id} = ${view_11706.id} ;;
    required_joins: []
  }

  join: view_11707 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11704.account_id} = ${view_11707.account_id} ;;
    required_joins: [view_11706]
  }

  join: view_11708 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11704.category} = ${view_11708.category} ;;
  }

  access_filter: {
    field: view_11704.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11704.is_deleted} = false ;;
}
