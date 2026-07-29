# Explore: explore_1688
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05065.view.lkml"
include: "/views/domain_17/view_05067.view.lkml"
include: "/views/domain_18/view_05068.view.lkml"
include: "/views/domain_19/view_05069.view.lkml"

explore: explore_1688 {
  label: "Explore Explore 1688"
  description: "Comprehensive analytics explore joining base view_05065 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05065
  
  always_filter: {
    filters: [view_05065.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05065.created_at_date: "7 days"]
    unless: [view_05065.id, view_05065.status]
  }

  join: view_05067 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05065.user_id} = ${view_05067.id} ;;
    required_joins: []
  }

  join: view_05068 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05065.account_id} = ${view_05068.account_id} ;;
    required_joins: [view_05067]
  }

  join: view_05069 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05065.category} = ${view_05069.category} ;;
  }

  access_filter: {
    field: view_05065.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05065.is_deleted} = false ;;
}
