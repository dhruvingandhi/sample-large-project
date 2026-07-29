# Explore: explore_1901
# Auto-generated LookML Explore File

include: "/views/domain_04/view_05704.view.lkml"
include: "/views/domain_06/view_05706.view.lkml"
include: "/views/domain_07/view_05707.view.lkml"
include: "/views/domain_08/view_05708.view.lkml"

explore: explore_1901 {
  label: "Explore Explore 1901"
  description: "Comprehensive analytics explore joining base view_05704 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05704
  
  always_filter: {
    filters: [view_05704.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05704.created_at_date: "7 days"]
    unless: [view_05704.id, view_05704.status]
  }

  join: view_05706 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05704.user_id} = ${view_05706.id} ;;
    required_joins: []
  }

  join: view_05707 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05704.account_id} = ${view_05707.account_id} ;;
    required_joins: [view_05706]
  }

  join: view_05708 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05704.category} = ${view_05708.category} ;;
  }

  access_filter: {
    field: view_05704.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05704.is_deleted} = false ;;
}
