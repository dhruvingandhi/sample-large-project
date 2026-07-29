# Explore: explore_3568
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10705.view.lkml"
include: "/views/domain_07/view_10707.view.lkml"
include: "/views/domain_08/view_10708.view.lkml"
include: "/views/domain_09/view_10709.view.lkml"

explore: explore_3568 {
  label: "Explore Explore 3568"
  description: "Comprehensive analytics explore joining base view_10705 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10705
  
  always_filter: {
    filters: [view_10705.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10705.created_at_date: "7 days"]
    unless: [view_10705.id, view_10705.status]
  }

  join: view_10707 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10705.user_id} = ${view_10707.id} ;;
    required_joins: []
  }

  join: view_10708 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10705.account_id} = ${view_10708.account_id} ;;
    required_joins: [view_10707]
  }

  join: view_10709 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10705.category} = ${view_10709.category} ;;
  }

  access_filter: {
    field: view_10705.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10705.is_deleted} = false ;;
}
