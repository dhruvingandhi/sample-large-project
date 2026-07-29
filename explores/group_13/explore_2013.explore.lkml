# Explore: explore_2013
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06040.view.lkml"
include: "/views/domain_42/view_06042.view.lkml"
include: "/views/domain_43/view_06043.view.lkml"
include: "/views/domain_44/view_06044.view.lkml"

explore: explore_2013 {
  label: "Explore Explore 2013"
  description: "Comprehensive analytics explore joining base view_06040 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06040
  
  always_filter: {
    filters: [view_06040.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06040.created_at_date: "7 days"]
    unless: [view_06040.id, view_06040.status]
  }

  join: view_06042 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06040.user_id} = ${view_06042.id} ;;
    required_joins: []
  }

  join: view_06043 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06040.account_id} = ${view_06043.account_id} ;;
    required_joins: [view_06042]
  }

  join: view_06044 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06040.category} = ${view_06044.category} ;;
  }

  access_filter: {
    field: view_06040.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06040.is_deleted} = false ;;
}
