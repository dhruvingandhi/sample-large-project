# Explore: explore_2411
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07234.view.lkml"
include: "/views/domain_36/view_07236.view.lkml"
include: "/views/domain_37/view_07237.view.lkml"
include: "/views/domain_38/view_07238.view.lkml"

explore: explore_2411 {
  label: "Explore Explore 2411"
  description: "Comprehensive analytics explore joining base view_07234 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07234
  
  always_filter: {
    filters: [view_07234.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07234.created_at_date: "7 days"]
    unless: [view_07234.id, view_07234.status]
  }

  join: view_07236 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07234.user_id} = ${view_07236.id} ;;
    required_joins: []
  }

  join: view_07237 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07234.account_id} = ${view_07237.account_id} ;;
    required_joins: [view_07236]
  }

  join: view_07238 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07234.category} = ${view_07238.category} ;;
  }

  access_filter: {
    field: view_07234.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07234.is_deleted} = false ;;
}
