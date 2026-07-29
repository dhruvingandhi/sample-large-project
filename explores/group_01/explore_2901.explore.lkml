# Explore: explore_2901
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08704.view.lkml"
include: "/views/domain_06/view_08706.view.lkml"
include: "/views/domain_07/view_08707.view.lkml"
include: "/views/domain_08/view_08708.view.lkml"

explore: explore_2901 {
  label: "Explore Explore 2901"
  description: "Comprehensive analytics explore joining base view_08704 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08704
  
  always_filter: {
    filters: [view_08704.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08704.created_at_date: "7 days"]
    unless: [view_08704.id, view_08704.status]
  }

  join: view_08706 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08704.user_id} = ${view_08706.id} ;;
    required_joins: []
  }

  join: view_08707 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08704.account_id} = ${view_08707.account_id} ;;
    required_joins: [view_08706]
  }

  join: view_08708 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08704.category} = ${view_08708.category} ;;
  }

  access_filter: {
    field: view_08704.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08704.is_deleted} = false ;;
}
