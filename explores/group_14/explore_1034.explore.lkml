# Explore: explore_1034
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03103.view.lkml"
include: "/views/domain_05/view_03105.view.lkml"
include: "/views/domain_06/view_03106.view.lkml"
include: "/views/domain_07/view_03107.view.lkml"

explore: explore_1034 {
  label: "Explore Explore 1034"
  description: "Comprehensive analytics explore joining base view_03103 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03103
  
  always_filter: {
    filters: [view_03103.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03103.created_at_date: "7 days"]
    unless: [view_03103.id, view_03103.status]
  }

  join: view_03105 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03103.user_id} = ${view_03105.id} ;;
    required_joins: []
  }

  join: view_03106 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03103.account_id} = ${view_03106.account_id} ;;
    required_joins: [view_03105]
  }

  join: view_03107 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03103.category} = ${view_03107.category} ;;
  }

  access_filter: {
    field: view_03103.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03103.is_deleted} = false ;;
}
